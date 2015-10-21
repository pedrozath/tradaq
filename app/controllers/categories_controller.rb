class CategoriesController < ApplicationController
    def create
        Category.create params[:category].permit(:name)
        redirect_to :back
    end

    def destroy
        Category.find(params[:id]).destroy
        redirect_to :back
    end
end