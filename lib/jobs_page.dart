import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  List<dynamic> jobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        jobs = jsonDecode(response.body).take(10).toList(); // Fetch 10 jobs
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  void deleteJob(int id) {
    setState(() {
      jobs.removeWhere((job) => job['id'] == id);
    });
  }

  void editJob(int id, String newTitle) {
    setState(() {
      jobs = jobs.map((job) {
        if (job['id'] == id) job['title'] = newTitle;
        return job;
      }).toList();
    });
  }

  // Add Job Function
  void addJob(String title) {
    setState(() {
      jobs.add({
        'id': jobs.length + 1,  // Simulate adding a new unique ID
        'title': title,
      });
    });
  }

  // Function to open dialog for adding a new job
  void openAddJobDialog() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Job'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter job title'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  jobs.add({
                    'id': jobs.length + 1,  // Simulate adding a new unique ID
                    'title': controller.text,
                  });
                });
                Navigator.pop(context);  // Close the dialog after adding the job
              }
            },
            child: Text('Add'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),  // Just close the dialog without action
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
        actions: [
          // Add Job Button
          IconButton(
            icon: Icon(Icons.add),
            onPressed: openAddJobDialog,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Card(
                  child: ListTile(
                    title: Text(job['title']),
                    subtitle: Text('Job ID: ${job['id']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit Job Button
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            TextEditingController controller = TextEditingController(text: job['title']);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Edit Job'),
                                content: TextField(controller: controller),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      editJob(job['id'], controller.text);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Save'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        // Delete Job Button
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteJob(job['id']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
