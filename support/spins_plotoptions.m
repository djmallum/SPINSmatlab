% spinsplotoptions.m creates the optional arguments for spins_plot2d

% define expected options 
exp_dimen = {'X','Y','Z'};
exp_style = {'pcolor','contourf','contour'};
% define defaults 
d.dimen = 'Y';			% dimension
d.slice = [0 0];		% cross-section. opt. arg. must be single number
d.fnum = 1;			% figure window number to use
d.style = 'contourf';		% plotting style
d.ncontourf = 30;		% plotting regions in contourf style
d.ncontour = 10;		% contours in contour style
d.cont2 = 'Density';		% secondary field to plot
d.ncont2 = 6;			% contours of secondary field
d.colorbar = true;		% colorbar? (bool)
d.xskp = 1;			% x-grid points to skip
d.yskp = 1;			% y	"
d.zskp = 1;			% z	"
d.axis = 0;			% axis to plot. 0 denotes use of full domain
d.visible = true;		% make plot visible or not (bool)
d.savefig = false;		% save figure? (bool)
d.filename = 'filename';	% name of file to save

% parse options
p = inputParser;
addParameter(p,'dimen',d.dimen, @(x) any(validatestring(x,exp_dimen)))
addParameter(p,'slice',d.slice,@isnumeric)
addParameter(p,'fnum',d.fnum,@isnumeric)
addParameter(p,'style',d.style, @(x) any(validatestring(x,exp_style)))
addParameter(p,'ncontourf',d.ncontourf,@isnumeric)
addParameter(p,'ncontour',d.ncontour,@isnumeric)
addParameter(p,'cont2',d.cont2,@ischar)
addParameter(p,'ncont2',d.ncont2,@isnumeric)
addParameter(p,'colorbar',d.colorbar,@islogical)
addParameter(p,'xskp',d.xskp,@isnumeric)
addParameter(p,'yskp',d.yskp,@isnumeric)
addParameter(p,'zskp',d.zskp,@isnumeric)
addParameter(p,'axis',d.axis,@isnumeric)
addParameter(p,'visible',d.visible,@islogical)
addParameter(p,'savefig',d.savefig,@islogical)
addParameter(p,'filename',d.filename,@ischar)
parse(p,varargin{:})

% put options into a shorter structure
opts = p.Results;

% choose default cross-section slice based on which dimension is plotted
if params.ndims == 3
    if length(opts.slice) == 2
        if strcmp(opts.dimen, 'X')
            cross_section = sum(params.xlim)/2;
        elseif strcmp(opts.dimen, 'Y')
            cross_section = sum(params.ylim)/2;
        elseif strcmp(opts.dimen, 'Z')
            cross_section = sum(params.zlim)/2;
        end
    elseif length(opts.slice) == 1
        cross_section = opts.slice;
    end
else
    cross_section = 0;
end

% make file name more appropriate if not given
if strcmp(opts.filename,'filename')
    filename = [var,int2str(t_index)];
else
    filename = opts.filename;
end

% get grid points and grid for plotting
[nx, ny, nz, xvar, yvar, zvar, plotaxis] = get_plot_points(gd, params, cross_section, opts);
