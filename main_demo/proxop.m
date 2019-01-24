function proxop_xk = proxop(xk)
% Cet opérateur proximal est défini pour la soft margin ie ||x||1 est le 
% terme de réguarisation.
    if xk >= 1
        proxop_xk = xk-1;
    elseif abs(xk) < 1
        proxop_xk = 0;
    else 
        proxop_xk = xk + 1;
    end
end

