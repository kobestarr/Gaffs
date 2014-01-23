class GaffsController < ApplicationController
  def index
  	@gaffs = Gaff.near('London')
  end

  def show
  		@gaff = Gaff.find(params[:id])
  end

  def new
  	@gaff = Gaff.new


  end
  
  def create
		@gaff = Gaff.new(gaff_params)

	if @gaff.save
		flash[:success] = "You have just sorted a new gaff!"
		redirect_to gaff_path(@gaff)
	else
		render "new"



	end
  end

  def edit 
  	# this is the form
  	@gaff = Gaff.find(params[:id])
  end

	


    def update
    	@gaff = Gaff.find(params[:id])

    	if @gaff.update(gaff_params)
    		flash[:success] = "your room has been updated"
    		redirect_to gaff_path(@gaff)

    	else	
    		render "edit"
    	end
  	end


    def destroy

    	@gaff = Gaff.find(params[:id])
    	@gaff.destroy
    	flash[:success] = "your room has been updated"
    	redirect_to root_path
  	end

    def gaff_params
  	#we need to know which parts of the gaff that can be edited and hide from the user

  	params.require(:gaff).permit(:title, :address, :description,
  		:max_guests, :bedrooms, :price	

  	 )



  	end

  



end
