% ObservationAgent: display scatter plot of all the agents in forest
% in a 2-D grid
classdef ObservationAgent < Agent
    
    properties
        isLodgepolePine
    end
    
    properties (Access = private)
        % Graphics handle
        h;
    end
    
    methods
        function this = ObservationAgent(loc)
            if nargin < 1
                loc = Location();
            end
            
            % Call super-class constructor
            this = this@Agent(loc);
            
            % Not a tree
            this.isLodgepolePine = false;
            
            % Initialize
            this.h = [];
        end
        
        function timeStep(this, sim)
            % Simulation agents
            xSize = sim.xSize;
            ySize = sim.ySize;
            xs = zeros(1,  xSize * ySize );
            ys = zeros(1, xSize * ySize);
            %zs = zeros(1, xSize * ySize);
            cs = zeros(xSize * ySize, 3);
            for i= 1:xSize
                for j = 1:ySize
                    agent = sim.agents{i,j};
                    idx = (i-1) * xSize + j;
                        
                    % White (to hide it)
                    cs(idx, :) = [1 1 1];
                    
                    if ~isempty(agent)
                        xs(idx) = i;
                        ys(idx) = j;
                        
                        if isa(agent, 'TreeAgent')
                            %zs(idx) = agent.age;
                        elseif isa(agent, 'RockAgent')
                            % Rock = brown
                            cs(idx, :) = [0.5 0.25 0];
                            continue;
                        else
                            % Skip over non-trees
                            continue;
                        end
                        
                         if agent.isInfested
                            infestation = agent.state.infestation;
                            % Dead = black
                            if agent.isDead
                                cs(idx, :) = [0 0 0];
                            else
                                % Low infestation = yellow
                                % High infestation = red
                                if infestation < 2
                                    r = 1;
                                    g = 1;
                                else
                                    r = 1;
                                    g = 0;
                                end
                                % Red component for infestation
                                cs(idx, :) = [r g 0];
                            end
                         elseif ~agent.isInfested
                            % Dead = black
                            if agent.isDead
                                cs(idx, :) = [0 0 0];
                            else
                                % RGB: green
                                % Create a green shade based on age of tree
                                g = 1;
                                % g = gradientGreen(agent.age);
                                cs(idx, :) = [0 g 0];
                            end
                        else
                            % White (to hide it)
                            cs(idx, :) = [1 1 1];
                        end
                    else
                        %xs(idx) = [];
                        %ys(idx) = [];
                    end
                end
            end
            
            sz = 25;
            if isempty(this.h)
                this.h = scatter(xs, ys, sz, cs, 'filled');
                % For 3D
                %this.h = scatter3(xs, ys, zs, sz, cs, 'filled');
                %hold on;
            else
                set(this.h, 'XData', xs, 'YData', ys, 'CData', cs);
                % For 3D                
                %set(this.h, 'XData', xs, 'YData', ys, 'ZData', zs, 'CData', cs);
                drawnow;
                %hold on;
                %NOTE: No need to pause
                %pause(0.1);
            end
        end
        
        function logState(this)
        end
    end
end