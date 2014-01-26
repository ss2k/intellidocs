CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider           => 'Rackspace',
    :rackspace_username => 'shah2k',
    :rackspace_api_key  => '8a9108f444dee1994da966b4d197b25e',
    :rackspace_region   => :iad                # optional, defaults to :dfw
  }
  config.fog_directory = 'uploadocs'
end