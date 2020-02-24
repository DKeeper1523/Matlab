% Represents a Rock in the simulation
classdef RockAgent < Agent
    
    properties
        isLodgepolePine;
    end
    
    methods
        function this = RockAgent(loc)
            if nargin < 1
                loc = Location();
            end
            this = this@Agent(loc);
            this.isLodgepolePine = false;
        end
    end
end