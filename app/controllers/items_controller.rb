class itemsController < ApplicationController
def index
  @items = item.all
end

def new
  @item = item.new
end

def create
  @item = Item.new(prototype_params)
end