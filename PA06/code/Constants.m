% Defines constants used by several classes
classdef (Abstract) Constants < handle
   
    properties (Constant)
        
        MAX_X = 100;
        MAX_Y = 100;
        
        INITAL_TREE_PCT = 0.20;

        NUM_TREES = Constants.MAX_X * Constants.MAX_Y * Constants.INITAL_TREE_PCT;
        NUM_INFESTED = 2;
        
        INITIAL_AGE = 1;
        
        PROB_NATURAL_DEATH = 0.01;
        
        PROB_SEEDLING = 0.010;
        
        SEEDLING_DISTANCE = 3;
        
        NUM_ROCKLINES = 3;
        MAX_RADIUS_ROCKLINES = 5;
    end
end