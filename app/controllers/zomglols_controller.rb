class ZomglolsController << ApplicationController

  respond_to :json

  def index
    respond_with(@zomglols = Zomglol.all)
  end

  def create
    respond_with(@zomglol = Zomglol.create(params[:zomglol]))
  end

  def show
    respond_with(@zomglol = Zomglol.find(params[:id]))
  end

  def update
    @zomglol = Zomglol.find(params[:id])
    @zomglol.update_attributes(params[:zomglol])
    respond_with(@zomglol)
  end

  def destroy
    @zomglol = Zomglol.find(params[:id])
    respond_with(@zomglol = @zomglol.destroy)
  end
end
