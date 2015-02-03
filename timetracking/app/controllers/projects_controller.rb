class ProjectsController < ApplicationController
	def index
		@list = Project.last_created_projects(10)
		if @list.empty?
			render 'no_projects', layout: 'no_projects'
		end
	end
	def show
		begin
			@project = Project.find params[:id]
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
		end
	end
end
