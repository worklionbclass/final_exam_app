class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
  end

  def create
    board = Board.create(title: params[:title], content: params[:content], user: current_user)
    
    redirect_to "/boards/show/#{board.id}"
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(title: params[:title], content: params[:content])
    
    redirect_to "/boards/show/#{board.id}"
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    
    redirect_to "/boards/index"
  end
end
