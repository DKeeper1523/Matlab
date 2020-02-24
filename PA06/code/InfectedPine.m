% Represents the infected state of a Lodgepole Pine tree in the simulation
% TODO: May be possible to reduce some code duplication
% and put some logic inside the base class TreeState
% TODO: Could rename to: InfectedTreeState (but kept old names so the files can be compared)
classdef InfectedPine < TreeState
    
    properties (Constant)
        INITIAL_INFESTATION = 1;
        PROB_INFESTATION = 1.0;
        INFESTATION_DISTANCE = 10;
        MONTHLY_INFESTATION_GROWTH = 1;
        INFESTATION_DEATH_THRESHOLD = 5;
        INFESTATION_SPREAD_THRESHOLD = 2;
        MIN_INFESTATION_AGE = 1;
    end
    
    % TODO: Make access private
    properties %(Access = private)
        pine
        
        % the level of infestation of this tree, if any
        infestation
    end
    
    methods

        function this = InfectedPine(pine)
            this.pine = pine;
            
            this.infestation = InfectedPine.INITIAL_INFESTATION;
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
            
            % increase infestation
            this.infestation = this.infestation + InfectedPine.MONTHLY_INFESTATION_GROWTH;
            
            % Chance to die naturally
            if sim.chance(Constants.PROB_NATURAL_DEATH)
                % fprintf('Infected Pine dying at age %d at (%d, %d)\n', this.age, ...
                %           this.loc.x, this.loc.y);
                sim.removeAgent(this.pine);
                %this.isDead = true;
                return;
            end
            
            % Infestation death
            if this.infestation >= InfectedPine.INFESTATION_DEATH_THRESHOLD
%                 fprintf('Infected Pine dying at age %d at (%d, %d)\n', this.age, ...
%                                 this.loc.x, this.loc.y);
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
                
                seedChance = Constants.PROB_SEEDLING * (Constants.SEEDLING_DISTANCE + 1 - dist) ...
                    / Constants.SEEDLING_DISTANCE;
                if sim.chance(seedChance)
                    seedling = TreeAgent(nearbyLoc, Constants.INITIAL_AGE);                    
                    sim.addAgent(seedling);
                end
            end
            
            % chance to infest nearby uninfested trees
            if this.infestation > InfectedPine.INFESTATION_SPREAD_THRESHOLD
                nearby = sim.getAgents(this.pine.loc, InfectedPine.INFESTATION_DISTANCE);
                for i=1:length(nearby)
                    a = nearby{i};
                    if a.isLodgepolePine && ~a.isInfested && a.age >= InfectedPine.MIN_INFESTATION_AGE
                        distance = this.pine.loc.distanceTo(a.loc);
                        if sim.chance(InfectedPine.PROB_INFESTATION * this.infestation * (InfectedPine.INFESTATION_DISTANCE + 1 - distance) / InfectedPine.INFESTATION_DISTANCE)
                            a.infect();
                        end
                    end
                end
            end
        end
        
        function logState(this)
            % TODO: Emit location too
            %fprintf('Infected pine of age: %d and infestation: %d\n', this.age, this.infestation);
        end
        
    end
    
end