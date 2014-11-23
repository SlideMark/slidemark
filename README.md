## SlideMark

------------

## 开发环境设置（mac）

我用的ruby版本2.0.0-p481，在其他版本下没试验过

```bash
# 安装mysql
brew install mysql

# 截屏需要
brew install qt

# 启动mysql, socket 在/tmp/mysql.socket
mysqld

# 安装gem
bundle install
```

创建rails环境

```bash
# 创建db
bundle exec rake db:create

# 更新db表
bundle exec rake db:migrate

# 启动rails
rails s
```

有用的命令

```bash
# 修改db schema
bundle exec rails g migration add_avatar_to_users avatar:string

#  把erb转换为haml
bundle exec rake haml:replace_erbs

# production环境下处理asset
bundle exec rake assets:precompile RAILS_ENV=production
```
