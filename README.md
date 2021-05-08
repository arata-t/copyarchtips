# users
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null :false               |
| email              | string | null :false, unique :true |
| encrypted_password | string | null :false               |
| last_name          | string | null :false               |
| first_name         | string | null :false               |
| introduction       | text   |                           |
|                    |        |                           |
## Association
has_many :tips
has_many :questions
has_many :answers
has_many :comments

# tips
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| title       | string     | null :false                   |
| category_id | string     | null :false                   |
| description | text       | null :false                   |
| user        | references | null :false,foreign_key :true |
|             |            |                               |
## Association
belongs_to :user
has_many :comments

# question
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| title       | string     | null :false                   |
| category_id | integer    | null :false                   |
| text        | text       | null :false                   |
| user        | references | null :false,foreign_key :true |
|             |            |                               |
## Association
belongs_to :user
has_many :answers


# answer
| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| answer   | text       | null :false                   |
| question | references | null :false,foreign_key :true |
| user     | references | null :false,foreign_key :true |
|          |            |                               |
belongs_to :user
belongs_to :question

# comment
| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| comment | text       | null :false                   |
| tweet   | references | null :false,foreign_key :true |
| user    | references | null :false,foreign_key :true |
|         |            |                               |
belongs_to :user
belongs_to :tip