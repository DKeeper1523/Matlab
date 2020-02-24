% Represents the healthy state of Lodgepole Pine tree in the simulation
% TODO: May be possible to reduce some code duplication
% and put some logic inside the base class TreeState
% TODO: Could rename to: HealthyTreeState (but kept old names so the files can be compared)
classdef LodgePolePine <  TreeState
    
    properties
        pine;
    end
    
    methods
        function this = LodgePolePine(pine)
            this.pine = pine;
        end
        
        function delete(this)
        end
        
        function timeStep(this, sim)
            % Handle dead trees
            if this.pine.isDead
                return;
            end

            % Adjust age
            this.pine.age = this.pine.age + 1;
            
            % Chance to die naturally
            if sim.chance(Constants.PROB_NATURAL_DEATH)
                % fprintf('Lodgepole Pine dying at age %d at (%d, %d)\n', this.age, ...
                %           this.loc.x, this.loc.y);
                sim.removeAgent(this.pine);
                %this.isDead = true;
                return;
            end
            
            % Chance to breed in nearby empty spots
            nearbyLocs = sim.getNearbyEmptySpots(this.pine.loc, Constants.SEEDLING_DISTANCE);
            for i=1:length(nearbyLocs)
                nearbyLoc = nearbyLocs(i);
                if nearbyLoc.x == 0 || nearbyLoc.y == 0
                    continue;
                end
                
                dist = this.pine.loc.distanceTo(nearbyLoc);
                
                seedlingChance = Constants.PROB_SEEDLING * (Constants.SEEDLING_DISTANCE + 1 - dist) ...
                    / Constants.SEEDLING_DISTANCE;
                if sim.chance(seedlingChance)
                    seedling = TreeAgent(nearbyLoc, Constants.INITIAL_AGE);
                    sim.addAgent(seedling);
                end
                
            end
        end
        
        function logState(this)
            % TODO: Emit location too
            %fprintf('LodgePolePine of age: %d\n', this.age);
        end
        
    end
end