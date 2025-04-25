require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleSns
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Sprocketsを無効化し、Propshaftを使ってアセットを管理
    config.assets.enabled = false  # Sprocketsを無効化
    config.assets.paths << Rails.root.join('app', 'assets', 'builds')

    # Propshaftの設定を追加（もし必要であれば）
    # config.assets.prefix = '/assets'  # 必要に応じて設定

    # Middlewareの設定をコメントアウトで有効化（CORS設定）
    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins '*'  # 必要に応じて制限
    #     resource '*',
    #       headers: :any,
    #       methods: [:get, :post, :patch, :put, :delete, :options, :head],
    #       expose: ['Content-Type', 'Accept']
    #   end
    # end

    # 自動ロードするlibを指定
    config.autoload_paths += %W(#{config.root}/lib)

    # その他、必要な設定
    # config.time_zone = "Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
