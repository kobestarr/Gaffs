class GaffsController < ApplicationController
  
  #before quite a few of the actions below
  #make sure you are signed in
  before_action :make_sure_logged_in, except: [:index, :show]



  def index
  	@gaff = Gaff.all#near('London')
  end

  def show
  		@gaff = Gaff.find(params[:id])
  end

  def new
  	@gaff = current_user.gaffs.new


  end
  
  def create
		@gaff = current_user.gaffs.new(gaff_params)

	if @gaff.save
		flash[:success] = "You have just sorted a new gaff!"
		redirect_to gaff_path(@gaff)
	else
		render "new"



	end
  end

  def edit 
  	# this is the form
  	@gaff = current_user.gaffs.find(params[:id])
  end

	


    def update
    	@gaff = current_user.gaffs.find(params[:id])

    	if @gaff.update(gaff_params)
    		flash[:success] = "your room has been updated"
    		redirect_to gaff_path(@gaff)

    	else	
    		render "edit"
    	end
  	end


    def destroy

    	@gaff = current_user.gaffs.find(params[:id])
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
