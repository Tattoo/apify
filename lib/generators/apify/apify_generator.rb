class Rails::ApifyGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model_name, :type => :string
  argument :fields, :type => :array


  def manifest
    model = model_name.capitalize

    @controller_template = <<"FILE"
class #{model.pluralize}Controller << ApplicationController

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

    #generate "model", "#{model_name} #{fields.join(' ')}"
    #
    create_file "app/controllers/#{model_name.pluralize}_controller.rb", @controller_template
    route "resources :#{model_name.pluralize}"

  end

end
