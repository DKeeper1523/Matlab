% SimulationDriver: container for the main function of the simulation program
% Keep the global constants in Constants.m so can duplicate the driver
% without duplicating the constants
classdef SimulationDriver1 < handle
    
    methods
        function this = SimulationDriver1()
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
            
            % Create RockAgents in lines
            for n = 1:Constants.NUM_ROCKLINES
                % Generate start location
                startLoc = sim.getRandomEmptySpot();
                % Generate end location
                endLoc = sim.getRandomEmptySpot();
                nearbyLocs = sim.getNearbyEmptySpotsOfLine(startLoc, endLoc);
                for i = 1:length(nearbyLocs)
                    nearbyLoc = nearbyLocs(i);
                    dist = nearbyLoc.distanceToLine(startLoc, endLoc);
                    if dist <= Constants.MAX_RADIUS_ROCKLINES
                        rock = RockAgent(nearbyLoc);
                        sim.addAgent(rock);
                    end
                end
            end
            
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