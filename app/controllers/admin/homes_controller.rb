class Admin::HomesController < ApplicationController
  
def index
  @orders = orders.all
end



end
