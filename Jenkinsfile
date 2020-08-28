node {
  stage('checkout') {
        checkout scm
  }

  /* To create EC2 Instance */
  stage('Automating') {
       def instances=params.No_of_Instances_required
       def image=params.EC2_Image_ID
       def dockerimage=params.Docker_Image
       if (params.Automation_Type == 'Full_Automation')
       {
         sh ("cd /opt/Full_Automation/terraform/dev && terraform plan -out=tfplan \
             -input=false -var='insta_count='${instances}'' -var='ami_type='${image}'' -lock=false") 
         sh ("cd /opt/Full_Automation/terraform/dev && terraform apply tfplan")
       /*  sh ("cd /opt/terransijenk/terraform/dev && terraform apply -var='insta_count='${instances}'' -var='ami_type='${image}'' -auto-approve -lock=false -no-color -out=create.tfplan") 
        */ 
     
     /* Ansible Playbook */        
         sh "cd /opt/Full_Automation/ansible && sudo sleep 30; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
             -u ubuntu -e 'image_id='${dockerimage}'' --private-key Jenkins.pem -i invent installdocker.yml"      
       
       }      
       
      
   }
}
