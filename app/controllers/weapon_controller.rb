class WeaponsController < ApplicationController
  def show 
    @zombie = Zombie.find(params['zombie_id'])
    @weapon = @zombie.weapons.find(params['id'])
  end

  def index
    @zombie = Zombie.find(params[:zombie_id])
    @weapons = @zombie.weapons
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weapons }
    end
  end

end
