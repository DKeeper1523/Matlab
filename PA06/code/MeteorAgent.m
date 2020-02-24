% Simulates meteor events in the simulation.
% For each time step, the MeteorAgent will generate several meteor events.
% Each meteor will destory the trees and leave a rock where it lands.
classdef MeteorAgent < Agent
    properties (Constant)
        PROB_HIT = 0.8
        MAX_METEOR_RADIUS = 5
        EXTRA_EFFECT_DISTANCE = 2
        MAX_NUM_PER_STEP = 3
    end
    
    properties (Access = private)
        isLodgepolePine
    end
    
     methods
        function this = MeteorAgent(loc)
            if nargin < 1
                loc = Location();
            end
            % Call super-class constructor
            this = this@Agent(loc);
            % Not a tree
            this.isLodgepolePine = false;
        end
        
        function timeStep(this, sim)
            for n = 1:MeteorAgent.MAX_NUM_PER_STEP
                if sim.chance(MeteorAgent.PROB_HIT)
                    meteorLoc = Location(randi(sim.xSize), randi(sim.ySize));
                    meteorR = randi(MeteorAgent.MAX_METEOR_RADIUS);
                    % destroy nearby trees
                    nearby = sim.getAgents(meteorLoc, meteorR + MeteorAgent.EXTRA_EFFECT_DISTANCE);
                    for i=1:length(nearby)
                        a = nearby{i};
                        if a.isLodgepolePine
                            sim.deleteAgent(a);
                        end
                    end
                    % leave a rock where this meteor lands
                    nearbyLocs = sim.getNearbyEmptySpots(meteorLoc, meteorR);
                    for i=1:length(nearbyLocs)
                        nearbyLoc = nearbyLocs(i);
                        dist = meteorLoc.distanceTo(nearbyLoc);
                        if dist <= meteorR
                            rock = RockAgent(nearbyLoc);
                            sim.addAgent(rock);
                        end
                    end
                end
            end
        end
        
        function logState(this)
        end
     end
end