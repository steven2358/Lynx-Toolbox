classdef MultiLabelTaskTest < matlab.unittest.TestCase
    
    methods(TestMethodSetup)
        
        function setup(testCase)
            MultiLabelTask.getInstance().clear();
        end
        
    end
    
    methods(TestMethodTeardown)
        function teardown(testCase)
            MultiLabelTask.getInstance().clear();
        end
    end
    
    methods (Test)
        
        function testForSingleton(testCase)
            testCase.verifyError(@() MultiLabelTask(), 'MATLAB:class:MethodRestricted');
        end
        
        function testForAssociatedObjects(testCase)
            b = MultiLabelTask.getInstance();
            testCase.verifyEqual(b.getDescription(), 'Multilabel classification');
        end
        
        function testForAddingFolder(testCase)
            MultiLabelTask.getInstance().addFolder('tests/dummydatasets');
            testCase.verifyEqual(length(MultiLabelTask.getInstance().folders), 2);
            MultiLabelTask.getInstance().addFolder('core');
            testCase.verifyEqual(length(MultiLabelTask.getInstance().folders), 3);
        end
        
        function testDatasetNotFound(testCase)
            o = MultiLabelTask.getInstance().loadDataset('valid_BC');
            testCase.verifyEmpty(o);
        end
        
        function testValidDataset(testCase)
            MultiLabelTask.getInstance().addFolder('tests/dummydatasets');
            o = MultiLabelTask.getInstance().loadDataset('valid_ML');
            testCase.verifyEqual(o.X.data, [1 2 3; 4 5 6]);
            testCase.verifyEqual(o.Y.data, [1 -1; -1 -1]);
        end
        
    end  
    
end

