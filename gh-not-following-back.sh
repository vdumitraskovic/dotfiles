#!/bin/sh
UNFOLLOW_CANDIDATES=$(gh api graphql --paginate -f query='
  query($endCursor: String) {
    viewer {
      following(first: 100, after: $endCursor) {
        pageInfo {
          hasNextPage
          endCursor
        }
        nodes {
          id
          login
          isFollowingViewer
        }
      }
    }
  }
' | jq -r '.data.viewer.following.nodes.[] | select(.isFollowingViewer == false)')

if [ ! -f ~/.gh_known_users ]; then
  touch ~/.gh_known_users
fi
handle_user_choice() {
  local username=$1

  if grep -q "$username" ~/.gh_known_users; then
    echo "User $username is already in the known users list. Skipping."
    return
  fi

  echo "User: $username"

  echo "1. Unfollow user"
  echo "2. Assign to known list"
  echo "3. Open user page in browser"
  echo "4. Skip"

  read -p "Enter your choice: " choice </dev/tty

  case $choice in
  1)
    # Unfollow the user
    echo "Unfollowing $username"
    # Get userId using jq with matching username
    local userId=$(echo "$UNFOLLOW_CANDIDATES" | jq -r --arg username "$username" 'select(.login == $username) | .id')
    gh api graphql -f query='mutation($userId: ID!) {
      unfollowUser(input: {userId: $userId}) {
        clientMutationId
      }
    }' -f userId="$userId"
    ;;
  2)
    # Assign to known list
    echo "Assigning $username to known list"
    echo "$username" >>~/.gh_known_users
    ;;
  3)
    # Open user page in browser
    echo "Opening $username's page in browser"
    open "https://github.com/$username"

    # Prompt again with the same menu
    handle_user_choice "$username"
    ;;
  4)
    # Skip
    echo "Skipping $username"
    ;;
  *)
    echo "Invalid choice"
    # Prompt again with the same menu
    handle_user_choice "$username"
    ;;
  esac
}

echo "$UNFOLLOW_CANDIDATES" | jq -r ".login" | sort | while read -r username; do
  handle_user_choice "$username"
done
