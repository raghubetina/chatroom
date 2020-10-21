# Chatroom

```sh
rails generate draft:devise user username:string memberships_count:integer
rails generate draft:scaffold team name:string rooms_count:integer memberships_count:integer
rails generate draft:scaffold room name:string anyone_can_join:boolean creator:references team:references hidden:boolean
rails generate draft:scaffold topic room:references name:string
rails generate draft:scaffold message topic:references body:text user:references
rails generate draft:scaffold membership user:references team:references role:string
```
