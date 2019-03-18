require "json"

class RouterResolver
    def accept_template_and_url(input)
        @url_and_template = input.readlines
    end

    def create_parameter_names(url_and_template)
        template = url_and_template[0].chomp
        @template_array = template.split("/")
        @parameter_names = []
        @template_array.each do |parameter|
            if /:/ =~ parameter
                @parameter_names << parameter.delete(":")
            end
        end
        @parameter_names
    end

    def build_parameters_hash(parameter_names, parameter_values)
        if parameter_names != nil
            @parameters_hash = Hash[parameter_names.zip(parameter_values)]
        else
            @parameters_hash = {}
        end
    end
    
    def build_parameter_values
        @parameter_values = []
        @url_array.each_with_index do |url_piece, index|
            if index.to_i.odd?
                @parameter_values << url_piece
            end
        end
    end
    
    def break_url_into_parts(url_rest)
        @protocol_with_slashes = @scheme_value + "://"
        @url_rest = @url.partition(@protocol_with_slashes)
        @url_array = @url_rest[2].split("/")
        @host_value = @url_array[0]
        if @url_array[2] != ("" || nil)
            build_parameter_values
        else
            @parameter_values = {}
        end
        create_parameter_names(@url_and_template)
        build_json_template
    end

    def build_path_value
        @path_array = @url_array - @url_array.take(1)
        if @path_array.count > 0
            @path_value = ""
            @path_array.each do |url_piece|
                @path_value = @path_value + "/" + url_piece
            end
        else 
            @path_value = "/"
        end
        @path_value
    end
    
    def build_json_template
        @json_template = {
            scheme: @scheme_value,
            host: @host_value,
            path: build_path_value,
            parameters: build_parameters_hash(@parameter_names, @parameter_values)
        }
        puts JSON.generate(@json_template)
    end

    def check_if_valid_url(url_and_template)
        @url = @url_and_template[1]
        if /404/ =~ @url
            puts JSON.generate({})
        elsif /https:\/\// =~ @url
            @scheme_value = "https"
            break_url_into_parts(@url_rest)
        elsif /http:\/\// =~ @url
            @scheme_value = "http"
            break_url_into_parts(@url_rest)
        else
            puts JSON.generate({})
        end
    end
    
    def resolve_request(standard_input)
        accept_template_and_url(standard_input)
        check_if_valid_url(@url_and_template)
    end
end

my_router = RouterResolver.new
my_router.resolve_request(STDIN)
