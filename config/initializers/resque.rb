# Este es necesario para docker, en ese caso necesita conectarse al
# host llamado 'redis'.
# redis_host        = ENV['REDIS_HOST'] || (File.exists?('/.dockerenv') ? 'redis' : 'localhost')
redis_host        = 'redis'
Resque.redis      = Redis.new(host: redis_host, port: 6379)
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
