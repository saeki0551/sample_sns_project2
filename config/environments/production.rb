require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # ログを標準出力に出力する設定
  config.logger = Logger.new(STDOUT)

  # ログレベルをデバッグに設定
  config.log_level = :debug


  config.action_mailer.default_url_options = { host: 'sample-sns.fly.dev' }

  # Allow all hosts to make requests to the app
  config.hosts.clear

  # コードの再読み込みを無効化（パフォーマンス向上）
  config.enable_reloading = false

  # イーガーロードを有効にしてパフォーマンスを向上
  config.eager_load = true

  # 完全なエラーレポートを無効化（本番環境でエラーを見せない）
  config.consider_all_requests_local = false

  # キャッシュを有効化
  config.action_controller.perform_caching = true

  # アセットのキャッシュ設定（1年の有効期限）
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }

  # アップロードファイルの保存先（ローカル）
  config.active_storage.service = :local

  # SSL設定を有効化
  config.force_ssl = true

  # ログ設定（STDOUTに出力）
  config.log_tags = [ :request_id ]
  config.logger   = ActiveSupport::TaggedLogging.logger(STDOUT)

  # ログレベルの設定（必要に応じて変更）
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # 健康チェックのログを抑制
  config.silence_healthcheck_path = "/up"

  # 非推奨警告をログに記録しない
  config.active_support.report_deprecations = false

  # キャッシュストアの設定（固有のキャッシュストアを使用）
  config.cache_store = :solid_cache_store

  # キューアダプターの設定（固有のキューアダプターを使用）
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = { database: { writing: :queue } }

  # メール送信エラーを抑制（設定に応じて）
  # config.action_mailer.raise_delivery_errors = false

  # メール送信時のデフォルトURL設定
  config.action_mailer.default_url_options = { host: "example.com" }

  # 国際化（I18n）フォールバックの設定
  config.i18n.fallbacks = true

  # スキーマをダンプしない
  config.active_record.dump_schema_after_migration = false

  # ActiveRecordのインスペクション時に:idだけを表示
  config.active_record.attributes_for_inspect = [ :id ]

  # DNSリバインディング保護を有効に
  # config.hosts = [
  #   "example.com",     # `example.com`からのリクエストを許可
  #   /.*\.example\.com/ # `www.example.com`などのサブドメインからも許可
  # ]

  # 健康チェックエンドポイントのDNSリバインディング保護をスキップ
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

  # 健康チェックリクエストをリダイレクトする設定
  config.before_configuration do
    Rails.application.config.middleware.insert_before 0, Rack::Rewrite do
      r301 %r{.*}, "/up", if: Proc.new { |env| env["REQUEST_PATH"] =~ /health_check/ }
    end
  end  
end
