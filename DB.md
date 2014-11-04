## DB Design

------------

## Basic Info

* Mysql


## Tables

### users
* Use device gem
* id
* name
* password
* nick_name
* facebook_id
* wechat_id
* linkedin_id

### ppts
* id
* user_id
* name
* content (blob/text/varchar) 

### tags 
* Use acts-as-taggable-on gem: https://github.com/mbleigh/acts-as-taggable-on
* id
* name 


## Furthur

### themes
* name
* template_content