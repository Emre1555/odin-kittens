class KittensController < ApplicationController

  def index
    @kittens = Kitten.all,
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new

  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten
      flash[:success] = "Kitten created!"
    else
      render 'new'
      flash[:error] = "Kitten not created!"
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    redirect_to kitten_path(@kitten)
    flash[:success] = "Kitten updated!"
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten deleted!"
    redirect_to kittens_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
    flash[:success] = "Kitten edited!"
  end
end

private 

def kitten_params
  params.require(:kitten).permit(:name, :age, :cuteness, :softness)
end
