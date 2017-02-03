class Premailer
  module Rails
    module CSSLoaders
      module FileSystemLoader
        extend self

        def load(url)
          prefix = [
            ::Rails.configuration.relative_url_root,
          ].join
          path = URI(url).path.sub(/\A#{prefix}/, '')

          file_path = "public#{path}"
          File.read(file_path) if File.file?(file_path)
        end
      end
    end
  end
end
