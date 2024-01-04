function betterplots2(FigLabel)

NumberOfChildren = length(FigLabel.Children);

for ii=1:NumberOfChildren
    object = FigLabel.Children(ii);
    
    switch lower(object.Type)
        case 'colorbar'
            object.Label.Interpreter = 'latex';
            object.FontSize=12;
            object.Label.FontSize = 12;
            object.TickLabelInterpreter = 'latex';
        case 'axes'
            object.XLabel.Interpreter = 'latex';
            object.XLabel.FontSize = 12;
            object.YLabel.FontSize = 12;
            object.YLabel.Interpreter = 'latex';
            object.ZLabel.Interpreter = 'latex';
            object.TickLabelInterpreter = 'latex';
            object.Title.Interpreter = 'latex';
            object.FontSize = 12;
        case 'legend'
            object.Interpreter = 'latex';
        case 'uicontextmenu'
        otherwise
            Warning('Unknown Figure Child')
    end
end


