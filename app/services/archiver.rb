class Archiver

  def initialize(server_root, s3_archive_location)
    @server_root = server_root
    @s3_archive_location = s3_archive_location
    @archive_name = 'minecraft_server.zip'
  end

  def backup(server_name)
    compress server_name
    upload server_name
    remove
  end

  private

  def compress(server_name)
    `zip -r #{@archive_name} #{@server_root}/#{server_name}`
  end

  def upload(server_name)
    `aws s3 cp #{@archive_name} s3://#{@s3_archive_location}/minecraft_server_#{server_name}_#{Time.now.strftime("%Y_%m_%d")}.zip`
  end

  def remove
    `rm #{@archive_name}`
  end

end