class PortfoliosController < ApplicationController
	def index
		@portfolios = Portfolio.all
	end

	def new
	 	@portfolio  = current_user.build_portfolio
	 	1.times { @portfolio.experiences}
	 	1.times { @portfolio.educas}
	 end

   def create
   	#debugger
   	@portfolio = current_user.build_portfolio(port_params)
   	if (@portfolio.save)
   		redirect_to portfolios_path
   		flash[:notice] = "Portfolio has successfully create"
   		else
		render :new
   	end
   end
	   
 def update
	#debugger
 	if current_user.portfolio.update(port_params)
 		redirect_to portfolios_path
 	flash[:notice]= "Portfolio has Successfuly update"
	else
 		render :new
 end
	end
	
	   private
	  		def port_params
			#params.require(:portfolio).permit(experience_attributes: [:companey_name, :experience_year, :skil])
			#params.require(:portfolio).permit(:project_description, experience_attributes:[:companey_name, :skil, :experience_year])
			params.require(:portfolio).permit(:description, educas_attributes:[:university, :passing_year] ,experiences_attributes:[:experience_year, :skil, :companey_name])


	  end
end

