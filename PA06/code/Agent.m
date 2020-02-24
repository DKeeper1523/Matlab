% Base class for Simulation Agent
classdef (Abstract) Agent < handle
    
    properties
        % Location of this Agent
        loc
    end

    methods
        function this = Agent(loc)
            if nargin < 1
                loc = Location();
            end
            
            this.loc = loc;
        end
        
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