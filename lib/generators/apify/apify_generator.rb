class Rails::ApifyGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model_name, :type => :string
  argument :fields, :type => :array


  def manifest
 #   model_name = self.model_name.downcase
 #   generate "model", "#{model_name} #{fields.join(' ')}"
 #   create_file "app/controllers/#{model_name.pluralize}_controller.rb", get_controller_template(model_name)
    generate_tests model_name
 #   route "resources :#{model_name.pluralize}"
 #   generate "helper", "#{model_name}"
  end


  private

  


  def get_controller_template(model_name)
    model = model_name.capitalize

    template = <<-FILE
class #{model.pluralize}Controller < ApplicationController

  respond_to :json

  def index
    respond_with(@#{model_name.pluralize} = #{model}.all)
  end

  def create
    respond_with(@#{model_name} = #{model}.create(params[:#{model_name}]))
  end

  def show
    respond_with(@#{model_name} = #{model}.find(params[:id]))
  end

  def update
    @#{model_name} = #{model}.find(params[:id])
    @#{model_name}.update_attributes(params[:#{model_name}])
    respond_with(@#{model_name})
  end

  def destroy
    @#{model_name} = #{model}.find(params[:id])
    respond_with(@#{model_name} = @#{model_name}.destroy)
  end
end
    FILE

    template
  end


  def generate_tests(model_name)
    controller = "#{model_name.pluralize}Controller"
    generate "integration_test", controller
    #TODO FIXME
    #insert_into_file "test/integration/#{model_name.pluralize}_controller_test.rb", "FOOBAR", :after => "require 'test_helper'\n"
     
    
  end

  def get_rspec_template()
    "ASDASDASDADS"
  end
end
