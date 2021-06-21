class AnimalsController < ApplicationController


    def index
        if params[:category_id]
            category = Category.find_by_id(params[:category_id])
            animals = category.animals
        else
            animals = Animal.all
        end
        render json: animals
    end

    def show 
        animal = Animal.find_by_id(params[:id])
        render json: AnimalSerializer.new(animal)

    end

    def create
   animal = Animal.new(animal_params) 
   if animal.save
    render json: AnimalSerializer.new(animal)
   else
    render json: {error: "animal not save"}
   end
    end


    def destroy 
        animal = Animal.find_by_id(params[:id])
        animal.destroy
        render json: {message: "#{animal.name} is deleted"}
    end

     def update
        animal = Animal.find_by_id(params[:id])
        animal.update(animal_params)
        render json: AnimalSerializer.new(animal)

    end



    private
    def animal_params
        params.require(:animal).permit(:name, :image, :description, :category_id)
    end
end
