class ProductbacklogsController < ApplicationController
  def index
    @productbacklogs = Productbacklog.all
  end
  
  def show
    @productbacklog = Productbacklog.find(params[:id])
  end

  def new
    @productbacklog = Productbacklog.new
  end
 
  def edit
    @productbacklog = Productbacklog.find(params[:id])
  end  

  def create
   # render plain: params[:productbacklog].inspect
    @productbacklog = Productbacklog.new(productbacklog_params)

    if @productbacklog.save
      flash[:notice] = "Product Backlog successfully created!"
      redirect_to action: "index"
    else
      render 'new'
    end
  end
  
  def update
    @productbacklog = Productbacklog.find(params[:id])
    
    if @productbacklog.update_attributes(productbacklog_params)
      flash[:notice] = "Product Backlog successfully updated!"
      redirect_to action: "index"
    else
      render 'edit'
    end
  end
  
  def confirmDelete
    @productbacklog = Productbacklog.find(params[:id])
  end

  def destroy
    @productbacklog = Productbacklog.find(params[:id])
    @productbacklog.destroy
    flash[:notice] = "Product Backlog successfully removed!"
    redirect_to action: "index"
  end

  private
    def productbacklog_params
      params.require(:productbacklog).permit(:name, :status_id)
    end  
end
