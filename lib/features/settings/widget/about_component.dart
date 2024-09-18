import 'package:flutter/material.dart';




showAboutUsBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:RichText(
                    text:  TextSpan(
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
                      children: const [
                        TextSpan(
                          text: 'HashTag Generator: Your AI-Powered Hashtag Assistant\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Unlock the full potential of your social media posts with HashTag Generator, the ultimate AI-driven tool designed to elevate your content and enhance your online presence. Whether you\'re a budding influencer, a small business owner, or just someone looking to share their thoughts with the world, this app is here to help you find the perfect hashtags that resonate with your audience.\n\n',
                        ),
                        TextSpan(
                          text: 'Key Features:\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '🌟 AI-Driven Suggestions: Harness the power of artificial intelligence to generate relevant hashtags based on your input. Our advanced algorithms analyze trends, context, and popularity to provide you with tailored suggestions that maximize your reach.\n\n',
                        ),
                        TextSpan(
                          text: '🔍 Smart Input Recognition: Simply type in a few keywords or phrases, and watch as the app instantly generates a list of hashtags that align with your content. The more you use it, the smarter it gets!\n\n',
                        ),
                        TextSpan(
                          text: '💡 Human Touch: We understand that social media is about connection. That\'s why our app includes curated suggestions that add a personal flair to your posts. Choose from a selection of engaging hashtags that reflect your unique style and voice.\n\n',
                        ),
                        TextSpan(
                          text: '📈 Trending Hashtags: Stay ahead of the curve with real-time updates on trending hashtags. Ensure your posts are relevant and capture the attention of a wider audience.\n\n',
                        ),
                        TextSpan(
                          text: '🗂️ Customizable Collections: Save your favorite hashtags in organized collections for quick access. Create sets for different themes, events, or campaigns, making it easier than ever to post consistently.\n\n',
                        ),
                        TextSpan(
                          text: '📊 Analytics & Insights: Track the performance of your posts and discover which hashtags resonate most with your audience. Use these insights to refine your strategy and grow your online presence.\n\n',
                        ),
                        TextSpan(
                          text: 'Why Choose HashTag Generator?\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'In a world where every post counts, finding the right hashtags can make all the difference. With HashTag Generator, you’re not just getting a tool; you’re gaining a partner in your social media journey. Our blend of cutting-edge AI technology and a human touch ensures you always have the right hashtags to tell your story, engage your audience, and stand out from the crowd.\n\n',
                        ),
                        TextSpan(
                          text: 'Join our community of creators and start generating impactful hashtags today. Download HashTag Generator and watch your social media engagement soar!',
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            );
          },
        );
      });
}