% SimulationDriver: container for the main function of the simulation program
% Keep the global constants in Constants.m so can duplicate the driver
% without duplicating the constants
classdef SimulationDriver2 < handle
    
    methods
        function this = SimulationDriver2()
        end
        
        % Set up the simulation and run it
        function out = run(this)
            out = [];
            
            % Create simulation
            sim = Simulation(Constants.MAX_X, Constants.MAX_Y);
            
            % Set the observation agent at (1,1)
            % So it always runs first
            loc = Location(1, 1);
            obs = ObservationAgent(loc);
            sim.addGlobalAgent(obs);
            
            % Create MeteorAgent
            meteor = MeteorAgent(loc);
            sim.addGlobalAgent(meteor);
            
            % Create agents
            for i=1:Constants.NUM_TREES
                loc = sim.getRandomEmptySpot();
                % Generate random age
                age = randi(TreeAgent.MAX_AGE);
                pine = TreeAgent(loc, age);
                sim.addAgent(pine);
            end
            
            for i=1:Constants.NUM_INFESTED
                loc = sim.getRandomEmptySpot();
                % Generate random age
                age = randi(TreeAgent.MAX_AGE);
                pine = TreeAgent(loc, age);
                pine.infect();
                sim.addAgent(pine);
            end
            
            % Run the simulation
            agentCount = sim.simulate();
            
            % Display number of agents.
            % Ideally, remove this and replace with Reporting Agent
            fprintf('There are %d agents\n', agentCount);
        end
    end
end