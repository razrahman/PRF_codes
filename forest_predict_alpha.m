function Y_hat = forest_predict_alpha(X_hat, model, Alpha,Eta)

forest = model.forest;
n_tree = size(forest,2);
variable_num = model.variable_num;
% I=find(Alpha>1.2/(Eta*n_tree));
% Alpha1=Alpha(I);
% Alpha1=Alpha1/sum(Alpha1);
Y_hat = zeros(size(X_hat,1),variable_num);
for i = 1:n_tree%length(I)%
    %i=I(ii);
    t = forest{1,i};
    Y_predict = single_tree_predict(X_hat, t, variable_num);
    
    parfor j = 1:variable_num
        Y_hat(:,j) = Y_hat(:,j) + Alpha(i)*Y_predict(:,j);
    end
        
end

%Y_hat = Y_hat/n_tree;

    

