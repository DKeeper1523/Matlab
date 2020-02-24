% Simulation: represents a agent-based simulation
classdef Simulation < handle

    properties (Constant)
        NUM_STEPS = 10;
    end
    properties
        xSize;
        ySize;
        
        % 2D array representing the grid
        agents
        
        globalAgents
    end
    
    methods
        function this = Simulation(dx, dy)
            this.xSize = dx;
            this.ySize = dy;
            
            % Pre-allocate the grid
            % Use [] instead of Agent.empty() since Agent is abstract
            this.agents{dx, dy} = [];
            
            % Global agents do not occupy a spot on the grid
            % But still participate in the simulation
            this.globalAgents = {};
        end
        
        % Run the simulation for NUM_STEPS steps
        % and return the agent count
        % NOTE: Could take extra argument whether or not to use logging
        function out = simulate(this)
            out = 0;
            
            for step=1:Simulation.NUM_STEPS

                % Iterate over global agents first                
                for i=1:length(this.globalAgents)
                    gAgent = this.globalAgents{i};
                    gAgent.timeStep(this);
                    gAgent.logState();
                end
                
                % Iterate over grid agents
                for i=1:this.xSize
                    for j=1:this.ySize
                        agent = this.agents{i,j};
                        if isempty(agent)
                            continue;
                        end
                        agent.timeStep(this);
                        agent.logState();
                    end
                end
            end
            
            % NOTE: We count separately since some agents may get removed
            count = 0;
            for i=1:this.xSize
                for j = 1:this.ySize
                    agent = this.agents{i,j};
                    if ~isempty(agent)
                        count = count+1;
                    end
                end
            end
            out = count;
        end
        
        % Return a randomly selected empty location on the simulation grid.
        % Requires that there at least one empty location.
        % NOTE: make more robust by testing for a completely full grid
        function out = getRandomEmptySpot(this)
            out = [];
            while true
                i = randi(this.xSize);
                j = randi(this.ySize);
                if isempty(this.agents{i,j})
                    out = Location(i, j);
                    break;
                end
            end
        end
        
        % Return true when a random draw between 0 and 1 is less than the specified probability
        function out = chance(this, prob)
            out = (rand() < prob);
        end
        
        % Return set of empty locations within distance of the passed-in location
        function out = getNearbyEmptySpots(this, loc, distance)
            out = Location();
            
            startx = max(1, loc.x - distance);
            endx = min(this.xSize, loc.x + distance);
            
            starty = max(1, loc.y - distance);
            endy = min(this.ySize, loc.y + distance);
            
            count = 1;
            for i= startx:endx
                for j = starty:endy
                    if isempty(this.agents{i,j})
                        out(count) = Location(i, j);
                        count = count + 1;
                    end
                end
            end
        end
        
        % Returns the set of empty locations within distance of the passed-in location
        % TODO: Can we use array here instead of cellarray?
        function out = getAgents(this, loc, distance)
            out = {};
            
            startx = max(1, loc.x - distance);
            endx = min(this.xSize, loc.x + distance);
            
            starty = max(1, loc.y - distance);
            endy = min(this.ySize, loc.y + distance);
            
            for i= startx:endx
                for j = starty:endy
                    agent = this.agents{i,j};
                    if ~isempty(agent)
                        out{end+1} = agent; %#ok<AGROW>
                    end
                end
            end
        end     
        
        function addGlobalAgent(this, gAgent)
            this.globalAgents{end+1} = gAgent;
        end
        
        function addAgent(this, agent)
            % TODO: Validate that the agent Location is set
            this.agents{agent.loc.x, agent.loc.y} = agent;
        end
        
        function removeAgent(this, agent)
            if isempty(agent)
                return;
            end
            
            if isa(agent, 'TreeAgent')
                agent.isDead = true;
                % Comment out 'return' below to remove Agent from the grid
                return;
            end
            
            this.deleteAgent(this, agent)
        end
        
        function deleteAgent(this, agent) 
            this.agents{agent.loc.x, agent.loc.y} = [];
            % Delete the agent to make sure it is no longer used
            % and to free up memory
            agent.delete();
        end
        
        
        % Return set of empty locations within the rectangle denoted by the
        % passed-in locations
        function out = getNearbyEmptySpotsOfLine(this, loc1, loc2)
            out = Location();
            startx = min(loc1.x, loc2.x);
            endx = max(loc1.x, loc2.x);
            starty = min(loc1.y, loc2.y);
            endy = max(loc1.y, loc2.y);
            count = 1;
            for i= startx:endx
                for j = starty:endy
                    if isempty(this.agents{i,j})
                        out(count) = Location(i, j);
                        count = count + 1;
                    end
                end
            end
        end
    end
end