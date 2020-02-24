% Represents a Lodgepole Pine tree in the simulation
classdef TreeAgent < Agent
    
    properties(Constant)
        % Maximum age of a tree
        MAX_AGE = 100;
    end
    
    % TODO: Make access private
    properties %(Access = private)
        % the age of this tree
        age;
        
        % true if this tree is dead (from either old age or infestation)
        isDead;
        
        % true if this agent is a Lodgepole Pine tree (including infected trees)
        isLodgepolePine;
        
        % true if this agent is an infacted Lodgepole Pine tree
        isInfested;
        
        % Separate object that represents the "State" of the tree
        % Use an instance of a class that is a sub-class of TreeState
        state;
    end
    
    methods
        function this = TreeAgent(loc, age)
            if nargin < 1
                loc = Location();
            end
            
            % Call super-class constructor
            this = this@Agent(loc);
            
            if nargin < 2
                age = 0;
            end
            
            this.age = age;
            
            this.isDead = false;
            this.isLodgepolePine = true;
            
            this.isInfested = false;
            
            % Default state is healthy pine
            this.state = LodgePolePine(this);
        end
        
        function timeStep(this, sim)
            this.state.timeStep(sim);
        end
        
        function logState(this)
        end
    end
    
    methods
        % Infect the Tree by setting its state to infected pine
        function infect(this)
            % Change the state to be in the infected state
            this.isInfested = true;
            % Destroy the old state
            %this.state.delete();
            this.state = InfectedPine(this);
        end

        % Cure the Tree by setting its state to healthy LodgePoleLine
        function cure(this)
            % Change the state to be in the healthy state
            this.isInfested = false;
            % Destroy the old state
            %this.state.delete();
            this.state = LodgePolePine(this);
        end
    end
end