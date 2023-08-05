import 'package:flutter/material.dart';
import 'package:suro/constants.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laws and Orders',
          style: TextStyle(color: iconcolor, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: iconcolor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Surrogate Rights',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: iconcolor,
                ),
              ),
              SizedBox(height: 20.0),
              Section(
                title: 'Informed Consent',
                content:
                    'Surrogates have the right to fully understand the surrogacy process, potential risks, and their role before agreeing to participate.',
              ),
              Section(
                title: 'Medical and Emotional Well-being',
                content:
                    'Surrogates should receive comprehensive medical care, psychological support, and counseling throughout the journey.',
              ),
              Section(
                title: 'Financial Fairness',
                content:
                    'Surrogates have the right to receive fair compensation for their time, effort, and any associated expenses, as outlined in the surrogacy contract.',
              ),
              Section(
                title: 'Decision-making',
                content:
                    'Surrogates have the right to be involved in decisions regarding medical procedures, birthing plans, and other aspects of the surrogacy journey.',
              ),
              Section(
                title: 'Autonomy and Control',
                content:
                    ' Surrogates maintain the right to make choices about their lifestyle, diet, and activities during the pregnancy, within the bounds of the agreed-upon contract.',
              ),
              Section(
                  title: 'Confidentiality',
                  content:
                      'Surrogates have the right to privacy regarding their personal information and participation in the surrogacy process.'),
              Section(
                title: 'Respect and Dignity',
                content:
                    'Surrogates should be treated with respect, empathy, and consideration for their emotional and physical well-being.',
              ),
              Section(
                  title: 'Legal Protection',
                  content:
                      ' Surrogates have the right to legal representation to ensure their interests are safeguarded in the surrogacy agreement and throughout the process.'),
              Section(
                title: 'Healthcare Choices',
                content:
                    'Surrogates can make decisions about their medical care and interventions during pregnancy, ensuring their health and well-being are prioritized.',
              ),
              Section(
                title: 'Emotional Support',
                content:
                    ' Surrogates deserve emotional support and understanding from intended parents, acknowledging the unique emotional journey they undertake.',
              ),
              Section(
                title: 'Childs Best Interests',
                content:
                    ' Surrogates have the right to advocate for the childs best interests, including decisions related to prenatal care and birthing preferences.',
              ),
              // Add more sections for terms

              SizedBox(
                  height:
                      40.0), // Add some spacing between terms and conditions

              Text(
                'Intended Parents Rights',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: iconcolor,
                ),
              ),
              SizedBox(height: 20.0),
              Section(
                title: 'Legal Parentage',
                content:
                    'Intended parents have the right to establish legal parentage of the child born through surrogacy, ensuring their rights and responsibilities are recognized.',
              ),
              Section(
                title: 'Informed Decision-making',
                content:
                    ' Intended parents have the right to thorough and accurate information about the surrogacy process, potential risks, and legal implications.',
              ),
              Section(
                title: 'Choice of Surrogate',
                content:
                    'Intended parents should have the freedom to choose a surrogate based on compatibility,values, and shared expectations.',
              ),
              Section(
                  title: 'Transparency',
                  content:
                      'Intended parents have the right to transparency regarding surrogate compensation, expenses, medical history, and any relevant background information.'),
              Section(
                title: 'Medical Updates',
                content:
                    ' Intended parents should receive regular updates on the surrogate health and the progress of the pregnancy, ensuring their involvement and peace of mind.',
              ),
              Section(
                  title: 'Involvement in Medical Decisions',
                  content:
                      ' Intended parents have the right to be included in medical decisions, prenatal care plans, and birthing preferences.'),
              Section(
                title: 'Emotional Connection',
                content:
                    ' Intended parents have the right to build a meaningful emotional connection with the surrogate, fostering a positive and supportive relationship.',
              ),
              Section(
                  title: 'Privacy',
                  content:
                      'Intended parents have the right to keep personal and sensitive information confidential, respecting both their privacy and the surrogate'),
              Section(
                title: 'Child Well-being',
                content:
                    ' Intended parents rights include ensuring the child well-being, safety, and access to appropriate medical care.',
              ),
              Section(
                title: 'Respect and Gratitude',
                content:
                    'Intended parents should treat the surrogate with gratitude, respect, and understanding for her generous contribution.',
              ),
              Section(
                title: 'Legal Guidance',
                content:
                    ' Intended parents have the right to legal counsel to navigate the complex legal aspects of surrogacy, ensuring compliance with relevant laws',
              ),
              Section(
                title: 'Expectation Clarity',
                content:
                    'Intended parents can expect clear communication and understanding about the surrogacy process, timelines, and potential outcomes.',
              ),
              Section(
                title: 'Medical Updates',
                content:
                    'Intended parents should receive timely and accurate medical updates to stay informed about the surrogate health and the pregnancy progress. ',
              ),
              Section(
                title: 'Financial Transparency',
                content:
                    'Intended parents have the right to a breakdown of costs, fees, and expenses,promoting transparency in financial arrangements. ',
              ),
              Section(
                title: 'Support Network',
                content:
                    'Intended parents can seek guidance from support networks, such as surrogacy agencies, counsellors, or legal advisors, to make informed decisions. ',
              ),
              Section(
                title: 'Legal Agreements',
                content:
                    'Intended parents rights include entering into a legally binding surrogacy contract that outlines rights, responsibilities, and potential scenarios.',
              ),
              Section(
                title: 'Parental Recognition',
                content:
                    'Intended parents have the right to secure their legal parental rights through court approved orders or other legal processes as required',
              ),
              Section(
                  title: 'Respectful Communication',
                  content:
                      'Intended parents and surrogates should engage in respectful and open communication, fostering a positive and trusting relationship.'),
              Section(
                title: 'Future Planning',
                content:
                    'Intended parents have the right to discuss and plan for the childs future, including issues related to healthcare, education, and inheritance.',
              ),
              // Add more sections for conditions
            ],
          ),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final String content;

  Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: iconcolor,
            ),
          ),
          SizedBox(height: 10.0),
          Text(content),
        ],
      ),
    );
  }
}
