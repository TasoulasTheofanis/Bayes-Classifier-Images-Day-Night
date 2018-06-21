# Bayes-Classifier-Images-Day-Night

## Read the full report in [English by clicking here](https://github.com/TasoulasTheofanis/Bayes-Classifier-Images-Day-Night/blob/master/Report_In_English.pdf), or in [Greek by click here](https://github.com/TasoulasTheofanis/Bayes-Classifier-Images-Day-Night/blob/master/Report_In_Greek.pdf)

- ### Naive Bayes classifiers constitute simple probability classifiers based on the Bayes theorem. This theorem expresses the likelihood of a pattern being classified in class ωi given the characteristic vector x. That likehood is equal to the probability, that describes the distribution of the vector x in the ωi class, multiplied by the probability of the pattern belonging to the ωi class, divided by the probability which defines the probabilistic function of x. 

- ### The algorithm of a Naive Bayes classifier seeks to recognise the different classes of a pattern and match it to the class that it belongs. Initially, it gets a set of attributes (let x1, χ2, ..., χM) which are called measurable characteristics or parameters. Given these, the pattern is classified in classes (let ω1, ω2, ..., ωM).

- ### Note that the algorithm always considers its features as not correlated, even if they are. That is the reason the reason for being called Naive. However, naive Bayes classifiers remain very effective in many true complex situations.

________________________________________________________________________________________
  
- ## This project represents the Pattern Recognition's naive bayes classifier. The code is written on Matlab and it classifies images of day and night.

- ## Basically the algorithm reads 20 images of day and 20 images of night. It also calculates the mean brightness and the variance of the brightness of each image. Based on that, it classifies the images to classes "day" or "night" via this:

### the normal distribution which displays the frequency y of an image, having a x value brightness
  
  ![Image](https://raw.githubusercontent.com/TasoulasTheofanis/Bayes-Classifier-Images-Day-Night/master/Screenshots%20-%20Matlab/01%20-%20Frequency%20x%20Bright.png)
  
### And that is the 3d graphic distribution, which displays the frequency y of an image, having a x value brightness and z brightness variance.  

   ![Image](https://raw.githubusercontent.com/TasoulasTheofanis/Bayes-Classifier-Images-Day-Night/master/Screenshots%20-%20Matlab/04%20-%20Bright%20x%20Variance%20x%20Frequency.png)
   
### Project implemented by [TasoulasTheofanis](https://github.com/TasoulasTheofanis)... that's me =D
