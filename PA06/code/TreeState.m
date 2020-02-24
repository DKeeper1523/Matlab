% Abstract base class the state of a tree
classdef (Abstract) TreeState < handle
    
    properties
    end

    methods
        function this = TreeState(loc)
        end
        
        % Still implement timeStep method so we can delegate
        
        % Update the state of this agent and others in the simulation sim 
        % to reflect this agent's actions in one time step.
        function timeStep(this, sim)
        end
        
        % Log the state of the agent to standard output.  
        % NOTE: A more realistic choice would be to accept a stream parameter for output; 
        function logState(this)
        end
    end
   
end