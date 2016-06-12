# PET SHOT

## データベース設計

- users
  - email
  - password
  - nickname
  - avatar
- articles
  - title
  - description
  - likes_count
  - user_id
- tags
- pets
  - name
  - profile
  - birthdate
  - weight
  - sex
  - free_comment
  - user_id
- comments
  - text
  - user_id
- likes
  - user_id
  - article_id
- images
  - name
  - article_id

## コントローラー設計

- home
  - index
- articles
  - new
  - create
  - edit
  - update
  - destroy
  - comments
    - create
    - destroy
- users
  - show
- pets
  - show
  - new
  - create
  - edit
  - update
  - destroy
- likes
  - create
  - destroy
