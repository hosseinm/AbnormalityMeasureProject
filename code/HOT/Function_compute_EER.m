function [ fina_EER,AccuracyTopic] = Function_compute_EER( Start_Test,H,test_label,no_repetitions,Lda_Rang,NumTopicLoop)
addpath('C:\my code\pwmetric')
no_topics=2:2:min(size(H,2),NumTopicLoop);
hj_accn1 = bsxfun(@rdivide, H, eps+ mean(H,2));
% hj_accn1 = bsxfun(@rdivide, H, eps+ sum(H,2));
train1= hj_accn1(1:Start_Test,:);
test1= hj_accn1(Start_Test+1:end,:);
% hj_accn = bsxfun(@rdivide, H, eps+ mean(H,2));
% no_repetitions = 5;
AccuracyTopic = zeros(no_repetitions,length(no_topics));
close all
for rep=1:no_repetitions
    disp(['processing loop '  num2str(rep)])
    for i=1:length( no_topics)
        
        [wt,td,~] = plsa(train1',no_topics(i),Lda_Rang,0);
        %Labels_test = [zeros(1,length(pos_lab)-pos_train_no), ones(1,length(neg_lab))];
        [~,td,E] = plsa(test1',no_topics(i),Lda_Rang,0,wt,0);
        
        [FPR, TPR, Thr, AUC, OPTROCPT] = perfcurve(test_label, E', 0);
        %         ROCOUT = roc([E',test_label]);
        res(i) = AUC;
        
        diagx = 0:0.001:1;
        diagy = 1:-0.001:0;
        D = [diagx',diagy'];
        R = [FPR,TPR];
        
        distances = slmetric_pw(D', R', 'eucdist');
        [r,c] = ind2sub( size( distances), find( distances == min( distances(:)) ));
        %     figure, plot( FPR, TPR ,'r');
        %     hold on
        %     plot(diagx,diagy,'b');
        %     plot( D(r,1),D(r,2),'ok');
        %
        accuracyRoc = D(r,2);
        
        classif = zeros(1,length(E));
        for e=1:length(E)
            predict = double( E<=E(e) )';
            classif(e) = sum(test_label == predict) / length( predict);
        end
        [~,maxc] = min( abs(classif - accuracyRoc ) );
        predict = double( E<E(maxc) )';
        tempSmooth = 30;
        mask = ones(1,tempSmooth);
        predictSmoothed = (conv(predict,mask,'same') / tempSmooth > 0.5 );
        AccuracyTopic(rep,i) = sum(test_label == predictSmoothed ) / length(predictSmoothed );
    end
end
fina_EER = 1-max( AccuracyTopic(:) );
%final_result_EER1(bincount,1)=fina_EER;
disp(['resul eer1 '  num2str(fina_EER)])
end

