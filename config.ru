require './config/environment'



use Rack::MethodOverride
use SpotsController
use BikesController
use UsersController
run ApplicationController