% Represents a location in an x,y coordinate system
% Implemented as a value class
classdef Location
    
    properties
        x;
        y;
    end
    
    methods
        % Default Constructor
        function this = Location(ax, ay)
            if nargin < 1
                ax = 0;
            end
            if nargin < 2
                ay = 0;
            end
            
            this.x = ax;
            this.y = ay;
        end
        
        % Euclidean Distance
        function out = distanceTo(this, loc)
            out = sqrt((loc.x - this.x)^2 + (loc.y - this.y)^2);
        end
        
        % Distance to a line (represented by two locations)
        function out = distanceToLine(this, loc1, loc2)
            if loc1.x == loc2.x
                if loc1.y == loc2.y
                    dist = distanceTo(this, loc1);
                else
                    dist = abs(this.y - loc1.y);
                end
            else
                k = (loc2.y - loc1.y)/(loc2.x - loc1.x);
                c = loc1.y - k * loc1.x;
                dist = abs(k * this.x - this.y + c)/sqrt(k^2 + 1);
            end
            out = dist;
        end
    end
end