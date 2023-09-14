module Factory

    # Acessa a massa de dados estatica
    class Static

        # Faz o load do arquivo 
        def self.load_file
            YAML.load_file(File.dirname(__FILE__) + "/static/#{ENVIRONMENT}.yml")
        end

        # Recebe uma chave e retorna um valor
        def self.static_data(data)
            Static.load_file[data]
        end

        # Recebe duas chaves e retorna um valor.
        def self.static_data_two data, data2
            Static.load_file[data][data2]
        end
    end
end